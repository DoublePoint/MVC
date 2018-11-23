<template>
    <div>
        <template v-for="item in this.items" >  
            <!-- if -->
            <ll-submenu v-if="item.children.length>0" :key="item.value" :index="item.label"  > 
                <template slot="title"  style="padding-left:10px" >
                    <i v-if="item.icon!=null&&item.icon!=''" :class="item.icon"></i>
                    <span slot="title">{{ item.label}}</span>
                </template>
                <ll-nav-menu-item :items="item.children"></ll-nav-menu-item> 
            </ll-submenu>
            <!-- else -->
            <ll-menu-item v-else :index="item.label"  :key="item.value" style="padding-left: 50px;">
                <span>{{item.label}}</span>
            </ll-menu-item>
        </template>
    </div>
</template>

<script>
export default {
  name: "LlNavMenuItem",
  props: {
    items: {
      default() {
        return [];
      },
      type: Array
    },
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