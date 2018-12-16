
import $request from './js/request.js'

import ElementUI from 'element-ui'
import resource from 'vue-resource'
import 'element-ui/lib/theme-chalk/index.css'
import './css/base.css'
import './css/base.less'

import vueTest from './test.vue' // 导入组件
import vueCascader from './cascader/cascader.vue'
import vueMenu from './menu/menu.vue'
import vueTree from './tree/tree.vue'
import vueGrid from './grid/grid.vue'
import vueGridColumn from './grid/gridColumn.vue'
import vueDropTree from './droptree/droptree.vue'

const vt = {
  install(Vue, options) {
    Vue.component(vueTest.name, vueTest) // vuePayKeyboard.name 组件的name属性
    Vue.component(vueCascader.name, vueCascader)
    Vue.component(vueMenu.name, vueMenu)
    Vue.component(vueTree.name, vueTree)
    Vue.component(vueGrid.name, vueGrid)
    Vue.component(vueGridColumn.name, vueGridColumn)
    Vue.component(vueDropTree.name,vueDropTree)
    Vue.prototype.$request = $request;
  }
}


Vue.use(ElementUI)
Vue.use(vt)
// export default vt // 导出.
