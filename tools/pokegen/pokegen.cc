// Copyright(c) 2020 Ashley Coleman
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#include <dirent.h>
#include <iostream>
#include <optional>
#include <stdio.h>
#include <string>
#include <vector>

#include "base_stats_emitter.h"
#include "egg_moves_emitter.h"
#include "evolution.h"
#include "evolution_emitter.h"
#include "json.h"
#include "level_up_move_emitter.h"
#include "pokemon.h"

bool simple_natural_sort(const std::string &a, const std::string &b)
{
    return (std::stoi(a) < std::stoi(b));
}

nlohmann::json parse_file(std::string path)
{
    FILE *fd = fopen(path.c_str(), "r");

    fseek(fd, 0, SEEK_END);
    long size = ftell(fd);
    fseek(fd, 0, SEEK_SET);

    std::vector<char> buffer(size);

    fread(buffer.data(), sizeof(char), size, fd);
    fclose(fd);

    std::string contents(buffer.data(), buffer.data() + size);

    return nlohmann::json::parse(contents);
}

void EmitAllFiles(const std::string &dst, std::vector<pokegen::Pokemon> pokemon)
{
    pokegen::BaseStatsEmitter base_stats_emitter;
    base_stats_emitter.Emit(dst + "/base_stats.h", pokemon);

    pokegen::EggMovesEmitter egg_moves_emitter;
    egg_moves_emitter.Emit(dst + "/egg_moves.h", pokemon);

    pokegen::EvolutionEmitter evolution_emitter;
    evolution_emitter.Emit(dst + "/evolution.h", pokemon);

    pokegen::LevelUpMoveEmitter level_up_move_emitter;
    level_up_move_emitter.EmitLevelUpMove(dst + "/level_up_learnsets.h", pokemon);
    level_up_move_emitter.EmitLevelUpMovePointers(dst + "/level_up_learnset_pointers.h", pokemon);
}

std::optional<std::vector<std::string>> collect_all_json_files(const std::string &src, const std::string &variant)
{
    DIR *directory = opendir(src.c_str());

    if (!directory)
    {
        std::cout << "Faile to open directory" << std::endl;
        return std::nullopt;
    }

    std::vector<std::string> files;

    struct dirent *directory_ent = readdir(directory);
    while (directory_ent)
    {
        std::string filename(directory_ent->d_name);

        // skip . and ..
        if (filename == "." || filename == "..")
        {
            directory_ent = readdir(directory);
            continue;
        }

        files.push_back(filename);
        directory_ent = readdir(directory);
    }
    closedir(directory);

    std::sort(files.begin(), files.end(), simple_natural_sort);

    // Find sets of entrees with the same number and select the correct variant
    for (long unsigned int i = 1; i < files.size(); i++)
    {
        const std::string &prev = files[i - 1];
        const std::string &curr = files[i];
        if (std::stoi(prev) == std::stoi(curr))
        {
            long unsigned int start = i - 1;
            long unsigned int end = i + 1;

            while (std::stoi(curr) == std::stoi(files[end]))
            {
                end++;
            }

            for (long unsigned int j = end; j > start; j--)
            {
                // filename should be 123-pikachu.<variant>.json
                if (files[j - 1].find("." + variant + ".") == std::string::npos)
                {
                    files.erase(files.begin() + j - 1);
                }
            }
        }
    }

    return files;
}

int main(int argc, char **argv)
{
    if (argc != 4)
    {
        std::cout << "Usage: pokegen <dir/to/json/files> <dir/to/output/files> <variant>" << std::endl;
        return 1;
    }

    std::string src(argv[1]);
    std::string dst(argv[2]);
    std::string variant(argv[3]);

    auto files = collect_all_json_files(src, variant);

    if (!files)
    {
        return 1;
    }

    std::vector<pokegen::Pokemon> pokemon;
    for (auto &file : files.value())
    {
        pokegen::Pokemon p(parse_file(src + "/" + file));
        pokemon.push_back(std::move(p));
    }

    EmitAllFiles(dst, std::move(pokemon));

    return 0;
}