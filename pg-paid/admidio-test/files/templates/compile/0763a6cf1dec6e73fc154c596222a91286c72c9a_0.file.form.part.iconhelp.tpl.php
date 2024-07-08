<?php
/* Smarty version 4.4.1, created on 2024-07-05 12:23:05
  from '/opt/app-root/src/adm_program/installation/templates/sys-template-parts/parts/form.part.iconhelp.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.4.1',
  'unifunc' => 'content_6687c989a1d9e2_97874791',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0763a6cf1dec6e73fc154c596222a91286c72c9a' => 
    array (
      0 => '/opt/app-root/src/adm_program/installation/templates/sys-template-parts/parts/form.part.iconhelp.tpl',
      1 => 1719402860,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6687c989a1d9e2_97874791 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['helpTextIdLabel']->value) {?>
    <?php if (Language::isTranslationStringId($_smarty_tpl->tpl_vars['helpTextIdLabel']->value)) {?>
        <?php $_smarty_tpl->_assignInScope('helpTextIdLabel', $_smarty_tpl->tpl_vars['l10n']->value->get($_smarty_tpl->tpl_vars['helpTextIdLabel']->value));?>
    <?php }?>
    <i class="fas fa-info-circle admidio-info-icon" data-toggle="popover"
    data-html="true" data-trigger="hover click" data-placement="auto"
    title="<?php echo $_smarty_tpl->tpl_vars['l10n']->value->get('SYS_NOTE');?>
" data-content="<?php echo SecurityUtils::encodeHTML($_smarty_tpl->tpl_vars['helpTextIdLabel']->value);?>
"></i>
<?php }
}
}
