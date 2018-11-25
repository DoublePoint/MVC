<template>
    <div>
        <template v-for="item in this.items" >  
            <!-- if -->
            <ll-submenu v-if="item[childAlias]!=null&&item[childAlias].length>0" :key="item[idAlias]" :index="item[idAlias]"  > 
                <template slot="title"  style="padding-left:10px" >
                    <i v-if="item.icon!=null&&item.icon!=''" :class="item.icon"></i>
                    <span slot="title">{{item[labelAlias]}}</span>
                </template>
                <ll-nav-menu-item :id-alias="idAlias" :label-alias="labelAlias" :child-alias="childAlias" :items="item[childAlias]"></ll-nav-menu-item> 
            </ll-submenu>
            <!-- else -->
            <ll-menu-item v-else :index="item[idAlias]" :route="item"  :key="item[idAlias]" style="padding-left: 50px;">
                <span>{{item[labelAlias]}}</span>
            </ll-menu-item>
        </template>
    </div>
</template>

<script>
import menuItem from "./menu-item.vue"; //引进菜单模板
export default {
  name: "LlNavMenuItem",
  components: {
    "LlNavMenuItem": menuItem //使用菜单组件
  },
  props: {
    items: {
      default() {
        return [];
      },
      type: Array
    },
    childAlias: {
      type:String
    },
    idAlias: {
      type:String
    },
    labelAlias: {
      type:String
    }
  },
  computed:{
    //  isCollapse () {
    //     return this.$store.state.menuCollapse;
    // }
  },
  data() {
    return {};
  },
  methods: {},
  
  created() {},
  mounted() {}
};
</script>