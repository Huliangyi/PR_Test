123

@startuml 权限模型查询流程（含公开/私有判断）
start

:用户发起操作;
switch (操作发生在?)
case (项目内)
  :[项目层] 查询用户是否为项目成员;
  if (是项目成员?) then (是)
    :获取项目角色;
    :获取项目角色绑定的权限点 (权限集A);
    :查询用户所属的所有Team;
    if (属于至少一个Team?) then (是)
      :获取该项目下所有Team角色;
      :获取该项目下所有Team角色绑定的权限点并集 (权限集B，去重);
      :计算最终权限 = A ∪ B (去重);
      stop
    else (否)
      stop
    endif
  else (否)
    :[项目层] 查询用户是否属于任何Team;
    if (属于至少一个Team?) then (是)
      :获取用户所属该项目下所有Team角色;
      :获取该项目下所有Team角色绑定的权限点并集 (去重);
      stop
    else (否)
      :判断该项目是否为公开;
      if (项目公开?) then (是)
        :[组织层] 查询用户;
        if (存在用户?) then (是)
          :获取组织角色;
          :判断该角色是否具有【项目权限是否下沉】属性;
          if (具有下沉属性?) then (是)
            :使用组织中配置的项目权限;
            stop
          else (否)
            :无权限;
            stop
          endif
        else (否)
          :判断该组织是否为公开;
          if (组织公开?) then (是)
            :[企业层] 查询用户;
            if (存在用户?) then (是)
              :获取企业角色;
              :判断该角色是否具有【项目权限是否下沉】属性;
              if (具有下沉属性?) then (是)
                :使用企业中配置的项目权限;
                stop
              else (否)
                :无权限;
                stop
              endif
            else (否)
              :无权限;
              stop
            endif
          else (否)
            :无权限;
            stop
          endif
        endif
      else (否)
        :无权限;
        stop
      endif
    endif
  endif

case (组织内)
  :[组织层] 查询用户;
  if (存在用户?) then (是)
    :获取组织角色;
    :获取该角色绑定的权限点;
    stop
  else (否)
    :判断该组织是否为公开;
    if (组织公开?) then (是)
      :[企业层] 查询用户;
      if (存在用户?) then (是)
        :获取企业角色;
        :判断该角色是否具有【组织权限是否下沉】属性;
        if (具有下沉属性?) then (是)
          :使用企业中配置的组织权限;
          stop
        else (否)
          :无权限;
          stop
        endif
      else (否)
        :无权限;
        stop
      endif
    else (否)
      :无权限;
      stop
    endif
  endif

case (企业内)
  :[企业层] 查询用户;
  if (存在用户?) then (是)
    :获取企业角色;
    :获取该角色绑定的权限点;
    stop
  else (否)
    :无权限;
    stop
  endif

endswitch

@enduml








# MPE 插件功能测试文档

> 本案例涵盖了 MPE 的主要特色：目录生成、数学公式、流程图/时序图、代码块运行、幻灯片模式以及导出功能。

[TOC]

## 1. 数学公式（LaTeX）

MPE 支持行内公式和块级公式。

**行内公式**：质能方程 \( E = mc^2 \) 是一个简单的例子。

**块级公式**：
$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$

**多行对齐**：
$$
\begin{aligned}
\nabla \cdot \mathbf{E} &= \frac{\rho}{\varepsilon_0} \\
\nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t}
\end{aligned}
$$

## 2. 图表绘制（Mermaid）

### 流程图
```mermaid
graph TD
    A[用户输入] --> B{MPE 是否安装？}
    B -- 是 --> C[正常渲染图表]
    B -- 否 --> D[提示安装插件]
    C --> E[导出 PDF/HTML]
    D --> F[结束]




revertrevertr123123123123evertre1231vertrerevert
revert
revert
revertrevert
<!- @include: xxx.md -->

revertrevertrevert



[![Star History Chart](https://api.star-history.com/svg?repos=Huliangyi/PR_Tes-t&type=Date)](https://star-history.com/#owner/repo&Date)





```
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edithttps://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/1491231231231
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149

https://github.com/Huliangyi/PR_Tes-t/edit/main/.github/ISSUE_TEMPLATE/bug_report.md?pr=/Huliangyi/PR_Tes-t/pull/149
```

在线图片，GitHub域名的：<img width="402" height="163" alt="image" src="https://github.com/user-attachments/assets/450d040a-c5f0-4299-83f2-eedc0192ff8e" />
<img alt="Warp sponsorship" width="400" src="https://github.com/warpdotdev/brand-assets/blob/main/Github/Sponsor/Warp-Github-LG-02.png">


[[aaaa]:bbbb](https://www.baidu.com)

案例裂图：![](https://visitor-badge.glitch.me/badge?page_id=fancylife.awesome-free-saas)123123
MD裂图1：![](./IMG_2131918.png)12313
HTML裂图2：<img width="483" height="256" alt="image" src="https://github.com/user-attachments/assets/77ba1098-9fd123123b-4581-b0cd-5f5f123aff642b5" />123123

-----

案例裂图：![](https://visitor-badge.glitch.me/badge?page_id=fancylife.awesome-free-saas)123123

MD裂图1：![](./IMG_2131918.png)12313

HTML裂图2：<img width="483" height="256" alt="image" src="https://github.com/user-attachments/assets/77ba1098-9fd123123b-4581-b0cd-5f5f123aff642b5" />123123

----

只有通过PR提的co-authored-by才会生效？

123123123123123
rev这是一个commit，马上就要revert。ert
文件行数变更1231312313
文件行数变更
文件行数变更
文件行数变更
文件行数变更
[[aaaa]:bbbb](https://www.baidu.com)
122323123
<div style="display:flex; flex-wrap:wrap; gap:8px;">
	<img src="./IMG_191312317.png" width="32%" />
	<img src="./IMG_1918.png" width="32%" />
	<img src="./IMG_1919.png" width="32%" />
	<img src="./IMG_1916.png" width="32%" />
	<img src="./IMG_1925.png" width="32%" />
	<img src="./IMG_1926.png" width="32%" />
</div>
<div align="center">
  <img src="https://bing.ee123.net/img/rand" alt="今日壁纸">
</div>

<div align="center">
  <img src="https://v2.jinrishici.com/one.svg" alt="今日诗词">
</div>

