import LlDropdownMenu from '../dropdown/src/dropdown-menu';

/* istanbul ignore next */
LlDropdownMenu.install = function(Vue) {
  Vue.component(LlDropdownMenu.name, LlDropdownMenu);
};

export default LlDropdownMenu;
