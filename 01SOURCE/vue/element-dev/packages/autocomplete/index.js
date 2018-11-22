import LlAutocomplete from './src/autocomplete';

/* istanbul ignore next */
LlAutocomplete.install = function(Vue) {
  Vue.component(LlAutocomplete.name, LlAutocomplete);
};

export default LlAutocomplete;
