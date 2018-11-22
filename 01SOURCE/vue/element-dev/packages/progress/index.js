import LlProgress from './src/progress';

/* istanbul ignore next */
LlProgress.install = function(Vue) {
  Vue.component(LlProgress.name, LlProgress);
};

export default LlProgress;
