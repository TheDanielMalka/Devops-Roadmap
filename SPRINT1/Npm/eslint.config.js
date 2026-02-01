const globals = require("globals");

module.exports = [
    {
        languageOptions: {
            globals: {
                ...globals.node,
            },
        },
        rules: {
            "no-unused-vars": "warn",
            "no-undef": "error"
        }
    }
];
