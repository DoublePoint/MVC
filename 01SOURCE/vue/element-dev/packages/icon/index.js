import LlIcon from './src/icon.vue';

/* istanbul ignore next */
LlIcon.install = function(Vue) {
  Vue.component(LlIcon.name, LlIcon);
};

export default LlIcon;
