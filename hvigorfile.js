const ohosPluginPath = '/Applications/DevEco-Studio.app/Contents/tools/hvigor/hvigor-ohos-plugin/index.js';
const { appTasks } = require(ohosPluginPath);
console.log('Hvigorfile: appTasks =', typeof appTasks);
module.exports = {
    default: {
        system: appTasks,
        plugins: []
    }
};
