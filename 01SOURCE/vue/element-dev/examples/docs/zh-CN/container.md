<style>
  .el-header, .el-footer {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  
  .el-aside {
    color: #333;
  }
  
  #chang-jian-ye-mian-bu-ju + .demo-container {
    .el-header, .el-footer {
      text-align: center;
    }
  
    .el-aside {
      background-color: #D3DCE6;
      text-align: center;
      line-height: 200px;
    }
  
    .el-main {
      background-color: #E9EEF3;
      color: #333;
      text-align: center;
      line-height: 160px;
    }
    
    & > .source > .el-container {
      margin-bottom: 40px;
    
      &:nth-child(5) .el-aside,
      &:nth-child(6) .el-aside {
        line-height: 260px;
      }

      &:nth-child(7) .el-aside {
        line-height: 320px;
      }
    }
  }
</style>

<script>
  export default {
    data() {
      const item = {
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      };
      return {
        tableData: Array(20).fill(item)
      }
    }
  };
</script>

## Container 布局容器
用于布局的容器组件，方便快速搭建页面的基本结构：

`<ll-container>`：外层容器。当子元素中包含 `<ll-header>` 或 `<ll-footer>` 时，全部子元素会垂直上下排列，否则会水平左右排列。

`<ll-header>`：顶栏容器。

`<ll-aside>`：侧边栏容器。

`<ll-main>`：主要区域容器。

`<ll-footer>`：底栏容器。

:::tip
以上组件采用了 flex 布局，使用前请确定目标浏览器是否兼容。此外，`<ll-container>` 的子元素只能是后四者，后四者的父元素也只能是 `<ll-container>`。
:::

### 常见页面布局

:::demo
```html
<ll-container>
  <ll-header>Header</ll-header>
  <ll-main>Main</ll-main>
</ll-container>

<ll-container>
  <ll-header>Header</ll-header>
  <ll-main>Main</ll-main>
  <ll-footer>Footer</ll-footer>
</ll-container>

<ll-container>
  <ll-aside width="200px">Aside</ll-aside>
  <ll-main>Main</ll-main>
</ll-container>

<ll-container>
  <ll-header>Header</ll-header>
  <ll-container>
    <ll-aside width="200px">Aside</ll-aside>
    <ll-main>Main</ll-main>
  </ll-container>
</ll-container>

<ll-container>
  <ll-header>Header</ll-header>
  <ll-container>
    <ll-aside width="200px">Aside</ll-aside>
    <ll-container>
      <ll-main>Main</ll-main>
      <ll-footer>Footer</ll-footer>
    </ll-container>
  </ll-container>
</ll-container>

<ll-container>
  <ll-aside width="200px">Aside</ll-aside>
  <ll-container>
    <ll-header>Header</ll-header>
    <ll-main>Main</ll-main>
  </ll-container>
</ll-container>

<ll-container>
  <ll-aside width="200px">Aside</ll-aside>
  <ll-container>
    <ll-header>Header</ll-header>
    <ll-main>Main</ll-main>
    <ll-footer>Footer</ll-footer>
  </ll-container>
</ll-container>

<style>
  .el-header, .el-footer {
    background-color: #B3C0D1;
    color: #333;
    text-align: center;
    line-height: 60px;
  }
  
  .el-aside {
    background-color: #D3DCE6;
    color: #333;
    text-align: center;
    line-height: 200px;
  }
  
  .el-main {
    background-color: #E9EEF3;
    color: #333;
    text-align: center;
    line-height: 160px;
  }
  
  body > .el-container {
    margin-bottom: 40px;
  }
  
  .el-container:nth-child(5) .el-aside,
  .el-container:nth-child(6) .el-aside {
    line-height: 260px;
  }
  
  .el-container:nth-child(7) .el-aside {
    line-height: 320px;
  }
</style>
```
:::

### 实例

:::demo
```html
<ll-container style="height: 500px; border: 1px solid #eee">
  <ll-aside width="200px" style="background-color: rgb(238, 241, 246)">
    <ll-menu :default-openeds="['1', '3']">
      <ll-submenu index="1">
        <template slot="title"><i class="el-icon-message"></i>导航一</template>
        <ll-menu-item-group>
          <template slot="title">分组一</template>
          <ll-menu-item index="1-1">选项1</ll-menu-item>
          <ll-menu-item index="1-2">选项2</ll-menu-item>
        </ll-menu-item-group>
        <ll-menu-item-group title="分组2">
          <ll-menu-item index="1-3">选项3</ll-menu-item>
        </ll-menu-item-group>
        <ll-submenu index="1-4">
          <template slot="title">选项4</template>
          <ll-menu-item index="1-4-1">选项4-1</ll-menu-item>
        </ll-submenu>
      </ll-submenu>
      <ll-submenu index="2">
        <template slot="title"><i class="el-icon-menu"></i>导航二</template>
        <ll-menu-item-group>
          <template slot="title">分组一</template>
          <ll-menu-item index="2-1">选项1</ll-menu-item>
          <ll-menu-item index="2-2">选项2</ll-menu-item>
        </ll-menu-item-group>
        <ll-menu-item-group title="分组2">
          <ll-menu-item index="2-3">选项3</ll-menu-item>
        </ll-menu-item-group>
        <ll-submenu index="2-4">
          <template slot="title">选项4</template>
          <ll-menu-item index="2-4-1">选项4-1</ll-menu-item>
        </ll-submenu>
      </ll-submenu>
      <ll-submenu index="3">
        <template slot="title"><i class="el-icon-setting"></i>导航三</template>
        <ll-menu-item-group>
          <template slot="title">分组一</template>
          <ll-menu-item index="3-1">选项1</ll-menu-item>
          <ll-menu-item index="3-2">选项2</ll-menu-item>
        </ll-menu-item-group>
        <ll-menu-item-group title="分组2">
          <ll-menu-item index="3-3">选项3</ll-menu-item>
        </ll-menu-item-group>
        <ll-submenu index="3-4">
          <template slot="title">选项4</template>
          <ll-menu-item index="3-4-1">选项4-1</ll-menu-item>
        </ll-submenu>
      </ll-submenu>
    </ll-menu>
  </ll-aside>
  
  <ll-container>
    <ll-header style="text-align: right; font-size: 12px">
      <ll-dropdown>
        <i class="el-icon-setting" style="margin-right: 15px"></i>
        <ll-dropdown-menu slot="dropdown">
          <ll-dropdown-item>查看</ll-dropdown-item>
          <ll-dropdown-item>新增</ll-dropdown-item>
          <ll-dropdown-item>删除</ll-dropdown-item>
        </ll-dropdown-menu>
      </ll-dropdown>
      <span>王小虎</span>
    </ll-header>
    
    <ll-main>
      <ll-table :data="tableData">
        <ll-table-column prop="date" label="日期" width="140">
        </ll-table-column>
        <ll-table-column prop="name" label="姓名" width="120">
        </ll-table-column>
        <ll-table-column prop="address" label="地址">
        </ll-table-column>
      </ll-table>
    </ll-main>
  </ll-container>
</ll-container>

<style>
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }
  
  .el-aside {
    color: #333;
  }
</style>

<script>
  export default {
    data() {
      const item = {
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      };
      return {
        tableData: Array(20).fill(item)
      }
    }
  };
</script>
```
:::

### Container Attributes
| 参数    | 说明     | 类型    | 可选值      | 默认值 |
|---------|----------|---------|-------------|--------|
| direction | 子元素的排列方向 | string | horizontal / vertical | 子元素中有 `ll-header` 或 `ll-footer` 时为 vertical，否则为 horizontal |

### Header Attributes
| 参数    | 说明     | 类型    | 可选值      | 默认值 |
|---------|----------|---------|-------------|--------|
| height | 顶栏高度 | string | — | 60px |

### Aside Attributes
| 参数    | 说明     | 类型    | 可选值      | 默认值 |
|---------|----------|---------|-------------|--------|
| width | 侧边栏宽度 | string | — | 300px |

### Footer Attributes
| 参数    | 说明     | 类型    | 可选值      | 默认值 |
|---------|----------|---------|-------------|--------|
| height | 底栏高度 | string | — | 60px |