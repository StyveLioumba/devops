<?php
/* Smarty version 4.4.1, created on 2024-07-05 12:24:19
  from '/opt/app-root/src/adm_program/installation/templates/installation_successful.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.4.1',
  'unifunc' => 'content_6687c9d347fe75_64738084',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3a0737f77f82f2ba381abc9ca5f2ca5f82176dc7' => 
    array (
      0 => '/opt/app-root/src/adm_program/installation/templates/installation_successful.tpl',
      1 => 1719402860,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6687c9d347fe75_64738084 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div id="installation-message">
    <h3><?php echo $_smarty_tpl->tpl_vars['l10n']->value->get("SYS_INSTALLATION_SUCCESSFUL");?>
</h3>

    <div class="alert alert-success form-alert">
        <i class="fas fa-check"></i>
        <strong><?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_INSTALLATION_SUCCESSFUL_SHORT_DESC');?>
</strong>
    </div>

    <p>
        <?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_INSTALLATION_SUCCESSFUL_DESC');?>
<br /><br />
        <?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('INS_SUPPORT_FURTHER_DEVELOPMENT');?>

    </p>

    <p><?php echo $_smarty_tpl->tpl_vars['content']->value;?>
</p>
</div>
<?php }
}
