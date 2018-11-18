import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import vueTest from './test.vue' // 导入组件
import vueTable from './table.vue'
import vueTableColumn from './table-column.vue'
import vueContainer from './container.vue'
import vueContainerAside from './container-aside.vue'
import vueContainerFooter from './container-footer.vue'
import vueContainerHeader from './container-header.vue'
import vueContainerMain from './container-main.vue'

const vt = {
  install(Vue, options) {
    Vue.component(vueTest.name, vueTest) // vuePayKeyboard.name 组件的name属性
    Vue.component(vueTable.name, vueTable)
    Vue.component(vueTableColumn.name, vueTableColumn)
    Vue.component(vueContainer.name, vueContainer)
    Vue.component(vueContainerAside.name, vueContainerAside)
    Vue.component(vueContainerFooter.name, vueContainerFooter)
    Vue.component(vueContainerHeader.name, vueContainerHeader)
    Vue.component(vueContainerMain.name, vueContainerMain)
    // 类似通过 this.$xxx 方式调用插件的 其实只是挂载到原型上而已
    // Vue.prototype.$xxx  // 最终可以在任何地方通过 this.$xxx 调用
    // 虽然没有明确规定用$开头  但是大家都默认遵守这个规定
  }
}
Vue.use(ElementUI)
Vue.use(vt)
export default vt // 导出.
