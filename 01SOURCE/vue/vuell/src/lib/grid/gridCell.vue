<template>
    <span  style="display: inline-block;min-width: 1px;">{{showLabel}}</span>
</template>

<script>
export default {
  name: "LlTableCellZz",
  data() {
    return {
      showLabel:"",
    };
  },
  model: {
    prop: 'trueValue',
    event: 'change1'
  },
  props: {
    labelDatasource: String,
    trueValue:""
  },
  methods: {
    change1(){
      //console.log("change1")
    },
    generateLabel(){
      //console.log("generate")
      var _this = this;
      if(this.labelDatasource!=null){
          this.$request.request({
            url:this.labelDatasource,
            data:{
              
            },
            params:{
              code:this.trueValue
            }
          },response=>{
            try{
              _this.showLabel=response.bodyText;
            }
            catch(e){
              throw new Error("ll: error:"+response);
            }
          },function(response){
            throw new Error("ll:ajax error:"+response);
          })
      }
    }
  },
  beforeMount: function() {
  },
  created: function() {
    this.generateLabel();
  },
  computed: {
    
  },
  watch: {
    // 如果 `value` 发生改变，这个函数就会运行
    trueValue: function (newValue, oldValue) {
      //console.log("gridcell")
      this.generateLabel();
    }
  }
};
</script>

<style lang="less">
</style>