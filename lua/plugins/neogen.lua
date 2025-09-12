return {
    "danymat/neogen",
    config = function()
        require("neogen").setup({
            enabled = true,
            languages = {
                java = {
                    template = {
                        class = {
                            [[
/**
 * Class: ${name}
 * Description: ${description}
 *
 * @author ${author}
 * @date ${date}
*/
                    ]]
                        },
                        type = {
                            [[
/**
 * Type: ${name}
 * Description: ${description}
*/
                    ]]
                        },
                        method = {
                            [[
/**
 * Method: ${name}
 * Description: ${description}
 *
 * @param ${param} ${param_desc}
 * @return ${return_desc}
*/
                    ]]
                        }
                    }
                }
            }
        })
    end,
}
