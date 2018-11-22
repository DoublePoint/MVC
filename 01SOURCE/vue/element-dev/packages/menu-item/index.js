import LlMenuItem from '../menu/src/menu-item';

/* istanbul ignore next */
LlMenuItem.install = function(Vue) {
  Vue.component(LlMenuItem.name, LlMenuItem);
};

export default LlMenuItem;
