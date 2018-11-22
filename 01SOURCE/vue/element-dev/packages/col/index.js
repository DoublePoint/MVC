import LlCol from './src/col';

/* istanbul ignore next */
LlCol.install = function(Vue) {
  Vue.component(LlCol.name, LlCol);
};

export default LlCol;

