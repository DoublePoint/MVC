<template>
  <ll-table-column :prop="prop" :label="label" :width="width" :align="align" :sortable="sortable">
    <!-- <template slot-scope="scope">
      <span v-if="!(scope.row.editFlag==null?false:scope.row.editFlag)"  @click="handleEdit(scope.row)">{{ scope.row[prop] }}</span>
      <span v-if="(scope.row.editFlag==null?false:scope.row.editFlag)" class="cell-edit-input"><ll-input ref="llHiddenInput"  v-model="scope.row[prop]" placeholder="请输入内容1" @blur="handleSave(scope.row)"></ll-input></span>
      <slot  :row="scope.row" ></slot>
    </template>-->
    <!-- <template slot="header" slot-scope="scope">
      <slot v-if="istemplate" name="header"></slot>
      <slot>{{scope.row[label]}}</slot>
    </template>-->
    <!-- <template v-if="istemplate" slot-scope="scope">
      <slot :row="scope.row"></slot>
      <slot>{{scope.row[prop]}}</slot>
    </template>-->
    <template slot-scope="scope">
      <slot :row="scope.row">
        <div style="width:100%;height:100%;margin:0;padding:0" v-if="isReadonly(scope.row,scope.$index)" 
          @click="handleEdit(scope.row,prop,scope.$index)">
            <span
        >{{ scope.row[prop]}}</span>
        </div>
        <!-- <span v-if="(scope.row[prop].editFlag==null?readonly:scope.row[prop].editFlag)" class="cell-edit-input"><ll-input ref="llHiddenInput"  v-model="scope.row[prop]" placeholder="请输入内容" @blur="handleSave(scope.row,prop)"></ll-input></span> -->
        <span v-if="!(isReadonly(scope.row,scope.$index))" class="cell-edit-input">
          <ll-input
            :ref="'llHiddenInput'"
            v-model="scope.row[prop]"
            placeholder="请输入内容"
            @blur="handleSave(scope.row,prop)"
          ></ll-input>
        </span>
      </slot>
    </template>
    <template slot-scope="scope" slot="header">
      <slot :row="scope.row" name="header">{{label}}</slot>
    </template>
  </ll-table-column>
</template>

<script>
export default {
  name: "LlGridColumn",
  data() {
    return {
      editIndexArray: [],
      currentEditIndex: -1
    };
  },
  props: {
    prop: String,
    istemplate: {
      default: false,
      type: Boolean
    },
    label: String,
    width: {
      default: 100,
      type: Number
    },
    align: {
      default: "left",
      type: String
    },
    readonly: {
      default: false,
      type: Boolean
    },
    sortable: {
      default: true,
      type: Boolean
    }
  },
  methods: {
    isReadonly(row, index) {
      if(index != this.currentEditIndex)
        return true;
      console.log("执行了isReadonly方法")
      var i = this.editIndexArray.findIndex(item => {
        return item.rowNum == index;
      });
      var readonly;
      if (i != -1)
        //表示存在该单元格的readonly数据
        readonly = this.editIndexArray[i].readonly;
      else
        readonly = this.readonly;
      //如果readonly=false 并且是当前的索引可以被编辑
      if (!readonly)
        return false;
      return true;
    },
    currentChange(currPage) {
      this.dataWrap.pageInfo.currentPageNum = currPage;
      this.$emit("current-change", currPage);
    },
    handleEdit: function(row, prop, index) {
      this.currentEditIndex = index;
      if(this.$refs["llHiddenInput"])
        setTimeout(() => {
          this.$refs["llHiddenInput"].focus();
        }, 300);
    },
    handleSave: function(row, prop) {
      this.currentEditIndex = -1;
    },
    //设置某行可被编辑
    setReadonly(isReadonly) {}
  },
  beforeMount: function() {
    // console.log("beforeMount----");
    console.log(this.$scopedSlots);
  },
  created: function() {
    // console.log("created----");
    console.log(this.$scopedSlots);
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