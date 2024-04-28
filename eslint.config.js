const jqueryConfig = require("eslint-config-jquery");

module.exports = [
    jqueryConfig,
    {
        rules: {
            "max-len": ["error", 200]
        }
    }
]