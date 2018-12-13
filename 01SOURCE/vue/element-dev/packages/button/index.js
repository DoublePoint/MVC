import LlButton from './src/button';

/* istanbul ignore next */
LlButton.install = function(Vue) {
  Vue.component(LlButton.name, LlButton);
};

export default LlButton;
