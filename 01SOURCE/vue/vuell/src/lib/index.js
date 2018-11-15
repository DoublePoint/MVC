import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import vuetest from './test.vue' // 导入组件

const vt = {
    install (Vue, options) {
        Vue.component(vuetest.name, vuetest)  // vuePayKeyboard.name 组件的name属性
       // 类似通过 this.$xxx 方式调用插件的 其实只是挂载到原型上而已
       // Vue.prototype.$xxx  // 最终可以在任何地方通过 this.$xxx 调用
       // 虽然没有明确规定用$开头  但是大家都默认遵守这个规定
    }
}
Vue.use(ElementUI)
Vue.use(vt)
export default vt // 导出.
