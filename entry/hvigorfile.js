const ohosPluginPath = '/Applications/DevEco-Studio.app/Contents/tools/hvigor/hvigor-ohos-plugin/index.js';
const { hapTasks } = require(ohosPluginPath);
console.log('Entry Hvigorfile: hapTasks =', typeof hapTasks);
module.exports = {
    default: {
        system: hapTasks,
        plugins: []
    }
};
