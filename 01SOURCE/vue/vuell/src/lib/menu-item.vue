<template>
    <div>
        <template v-for="item in this.items" >  
            <!-- if -->
            <el-submenu v-if="item.children.length>0" :key="item.value" :index="item.label"  > 
                <template slot="title"  style="padding-left:10px" >
                    <i v-if="item.icon!=null&&item.icon!=''" :class="item.icon"></i>
                    <span slot="title">{{ item.label}}</span>
                </template>
                <ll-menu-item :items="item.children"></ll-menu-item> 
            </el-submenu>
            <!-- else -->
            <el-menu-item v-else :index="item.label"  :key="item.value" style="padding-left: 50px;">
                <span>{{item.label}}</span>
            </el-menu-item>
        </template>
    </div>
</template>

<script>
export default {
  name: "ll-menu-item",
  props: {
    items: {
      default() {
        return [];
      },
      type: Array
    },
  },
  data() {
    return {};
  },
  methods: {},
  created() {},
  mounted() {}
};
</script>