<template>
    <div>
        <template v-for="item in this.items" >  
            <!-- if -->
            <ll-submenu v-if="item[props.childAlias]!=null&&item[props.childAlias].length>0" :key="item[props.idAlias]" :index="item[props.idAlias]"  > 
                <template slot="title"  style="padding-left:10px" >
                    <i v-if="item[props.iconAlias]!=null&&item[props.iconAlias]!=''" :class="item[props.iconAlias]"></i>
                    <span slot="title">{{item[props.labelAlias]}}</span>
                </template>
                <ll-nav-menu-item  :props="props" :items="item[props.childAlias]"></ll-nav-menu-item> 
            </ll-submenu>
            <!-- else -->
            <ll-menu-item v-else :index="item[props.idAlias]" :route="item"  :key="item[props.idAlias]" >
                <span>{{item[props.labelAlias]}}</span>
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
    props:{
      default() {
        return {
          childAlias: String,
          idAlias: String,
          labelAlias: String,
          iconAlias: String,
        }
      },
      type: Object
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