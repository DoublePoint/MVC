import LlTag from './src/tag';

/* istanbul ignore next */
LlTag.install = function(Vue) {
  Vue.component(LlTag.name, LlTag);
};

export default LlTag;
