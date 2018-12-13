import LlInput from './src/input';

/* istanbul ignore next */
LlInput.install = function(Vue) {
  Vue.component(LlInput.name, LlInput);
};

export default LlInput;
