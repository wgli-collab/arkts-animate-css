const ohosPluginPath = '/Applications/DevEco-Studio.app/Contents/tools/hvigor/hvigor-ohos-plugin/index.js';
const { harTasks } = require(ohosPluginPath);
console.log('Library Hvigorfile: harTasks =', typeof harTasks);
module.exports = {
    default: {
        system: harTasks,
        plugins: []
    }
};
