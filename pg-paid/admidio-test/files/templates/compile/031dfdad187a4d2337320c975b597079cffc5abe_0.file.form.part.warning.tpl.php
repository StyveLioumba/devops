<?php
/* Smarty version 4.4.1, created on 2024-07-05 12:23:05
  from '/opt/app-root/src/adm_program/installation/templates/sys-template-parts/parts/form.part.warning.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.4.1',
  'unifunc' => 'content_6687c989c37d81_49632514',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '031dfdad187a4d2337320c975b597079cffc5abe' => 
    array (
      0 => '/opt/app-root/src/adm_program/installation/templates/sys-template-parts/parts/form.part.warning.tpl',
      1 => 1719402860,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6687c989c37d81_49632514 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['alertWarning']->value) {?>
    <div class="alert alert-warning mt-3" role="alert">
        <i class="fas fa-exclamation-triangle"></i><?php echo $_smarty_tpl->tpl_vars['alertWarning']->value;?>

    </div>
<?php }
}
}
