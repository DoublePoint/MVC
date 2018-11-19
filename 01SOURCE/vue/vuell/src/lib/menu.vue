<template>
    <el-menu
        class="el-menu-vertical-demo"
        :collapse="isCollapse"
        background-color="rgb(73, 80, 96)" 
        text-color="rgba(255,255,255,0.7)" 
        unique-opened >       
        <ll-menu-item :items="items"></ll-menu-item>
    </el-menu>
</template>

<script>
import menuItem from "./menu-item.vue"; //引进菜单模板
export default{
    name:"ll-menu",
    props: {
        items: {
            default() {
                return [];
            },
            type: Array
        }
    },
    data(){
        return {
            isCollapse:false,//菜单展开功能
            unCollapse:{
            width:'220px'
            },
            collapse:{
            width:'50px'
            },
            unCollapseMain:{
            paddingLeft:'220px'
            },
            collapseMain:{
            paddingLeft:'50px'
            },
        }
    },
    methods:{
        toggleClick(){//菜单展开功能
        this.isCollapse=!this.isCollapse;
        }
    },
    components:{
        "ll-menu-item":menuItem//使用菜单组件
    }
}
</script>