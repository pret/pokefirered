#include "evolution.h"

#include "json.h"

namespace pokegen
{

    Evolution::Evolution(nlohmann::json json)
    {
        type_ = json["type"].get<std::string>();
        species_ = json["species"].get<std::string>();
        is_item_value_ = json["value"].is_string();

        if (is_item_value_)
        {
            item_value_ = json["value"].get<std::string>();
        }
        else
        {
            number_value_ = json["value"].get<int>();
        }
    }
} // namespace pokegen