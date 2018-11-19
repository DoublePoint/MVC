<template>
    <div>
        <template v-for="list in this.items" >  
            <el-submenu v-if="list.children.length>0" :key="list.resourceId" :index="list.resourceName"  > 
                <template slot="title"  style="padding-left:10px" >
                    <i class="el-icon-menu"></i>
                    <span slot="title">{{ list.resourceName}}</span>
                </template>
                <ll-menu :items="list.children"></ll-menu> 
            </el-submenu>
            <el-menu-item v-else :index="list.resourceName"  :key="list.resourceId" style="padding-left: 50px;">
                <span>{{list.resourceName}}</span>
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
    }
  },
  data() {
    return {};
  },
  methods: {},
  created() {},
  mounted() {}
};
</script>