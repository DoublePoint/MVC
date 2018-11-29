
import $request from './js/request.js'

import ElementUI from 'element-ui'
import resource from 'vue-resource'
import 'element-ui/lib/theme-chalk/index.css'
import baseCss from  './css/base.css'

import vueTest from './test.vue' // 导入组件
import vueMenu from './menu/menu.vue'
import vueTree from './tree/tree.vue'
import vueGrid from './grid/grid.vue'
import vueGridColumn from './grid/gridColumn.vue'

const vt = {
  install(Vue, options) {
    Vue.component(vueTest.name, vueTest) // vuePayKeyboard.name 组件的name属性
    Vue.component(vueMenu.name, vueMenu)
    Vue.component(vueTree.name, vueTree)
    Vue.component(vueGrid.name, vueGrid)
    Vue.component(vueGridColumn.name, vueGridColumn)
    Vue.prototype.$request = $request;
  }
}


Vue.use(ElementUI)
Vue.use(vt)
// export default vt // 导出.
