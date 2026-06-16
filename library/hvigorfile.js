const DEVECO_HOME = process.env.DEVECO_STUDIO_HOME || '/Applications/DevEco-Studio.app';
const { harTasks } = require(`${DEVECO_HOME}/Contents/tools/hvigor/hvigor-ohos-plugin`);
module.exports = {
    default: {
        system: harTasks,
        plugins: []
    }
};
