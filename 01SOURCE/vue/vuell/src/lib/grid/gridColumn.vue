<template>
  <ll-table-column :prop="prop" :label="label" :width="width" :align="align">
    <slot :row="scope"></slot>
    <template scope="scope">
      <span
        v-if="!(scope.row.editFlag==null?false:scope.row.editFlag)"
        @click="handleEdit(scope.row)"
      >{{ scope.row[prop] }}</span>
      <span v-if="(scope.row.editFlag==null?false:scope.row.editFlag)" class="cell-edit-input">
        <ll-input
          ref="llHiddenInput"
          v-model="scope.row[prop]"
          placeholder="请输入内容"
          @blur="handleSave(scope.row)"
        ></ll-input>
      </span>
    </template>
  </ll-table-column>
</template>

<script>
export default {
  name: "LlGridColumn",
  props: {
    prop: String,
    label: String,
    width: {
      default:100,
      type:Number
    },
    align: {
      default:"left",
      type:String
    },
    
  },
  methods: {
    currentChange(currPage) {
      this.dataWrap.pageInfo.currentPageNum = currPage;
      this.$emit("current-change", currPage);
    },
    handleEdit:function(row,refIndex){
        console.log(row)
        this.$set(row, "editFlag", true);
        setTimeout(() => {
          this.$refs.llHiddenInput.focus();
        }, 300);
      },
      handleSave:function(row){
        console.log(row)
        this.$set(row, "editFlag", false);
      },
  },
  computed: {
    wrap: function() {
      return this.dataWrap.dataList;
    }
  },
  watch: {}
};
</script>

<style>
</style>