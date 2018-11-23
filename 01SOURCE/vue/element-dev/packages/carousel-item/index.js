import LlCarouselItem from '../carousel/src/item';

/* istanbul ignore next */
LlCarouselItem.install = function(Vue) {
  Vue.component(LlCarouselItem.name, LlCarouselItem);
};

export default LlCarouselItem;
