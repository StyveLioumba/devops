<?php
/* Smarty version 4.4.1, created on 2024-07-05 12:23:06
  from '/opt/app-root/src/adm_program/installation/templates/installation.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.4.1',
  'unifunc' => 'content_6687c98a6efb27_36177670',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd740097006cdc0aeee994dfb91db42773751da8d' => 
    array (
      0 => '/opt/app-root/src/adm_program/installation/templates/installation.tpl',
      1 => 1719402859,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6687c98a6efb27_36177670 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="installation-dialog">
    <h3><?php echo $_smarty_tpl->tpl_vars['subHeadline']->value;?>
</h3>

    <p><?php echo $_smarty_tpl->tpl_vars['text']->value;?>
</p>

    <p><?php echo $_smarty_tpl->tpl_vars['content']->value;?>
</p>
</div>
<?php }
}
