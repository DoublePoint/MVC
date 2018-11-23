import LlBreadcrumb from './src/breadcrumb';

/* istanbul ignore next */
LlBreadcrumb.install = function(Vue) {
  Vue.component(LlBreadcrumb.name, LlBreadcrumb);
};

export default LlBreadcrumb;
