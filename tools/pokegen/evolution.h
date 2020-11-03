#ifndef TOOLS_POKEGEN_EVOLUTION_H_
#define TOOLS_POKEGEN_EVOLUTION_H_

#include "json.h"

namespace pokegen
{

    class Evolution
    {
    public:
        explicit Evolution(nlohmann::json json);

        const std::string &type() const
        {
            return type_;
        }

        const std::string &species() const
        {
            return species_;
        }

        const std::string &item_value() const
        {
            return item_value_;
        }

        int number_value() const
        {
            return number_value_;
        }

        bool is_item_value() const
        {
            return is_item_value_;
        }

    private:
        std::string type_;
        std::string species_;
        bool is_item_value_;
        int number_value_;
        std::string item_value_;
    };

} // namespace pokegen

#endif