<?php
/* Smarty version 4.4.1, created on 2024-07-05 12:23:05
  from '/opt/app-root/src/adm_program/installation/templates/sys-template-parts/parts/form.part.helptext.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.4.1',
  'unifunc' => 'content_6687c989b1ea01_49201841',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8955589821b06fda0d56687314a64041ddd40d60' => 
    array (
      0 => '/opt/app-root/src/adm_program/installation/templates/sys-template-parts/parts/form.part.helptext.tpl',
      1 => 1719402860,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6687c989b1ea01_49201841 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['helpTextIdInline']->value) {?>
    <?php if (is_array($_smarty_tpl->tpl_vars['helpTextIdInline']->value)) {?>
        <?php $_smarty_tpl->_assignInScope('helpTextIdInline', $_smarty_tpl->tpl_vars['l10n']->value->get($_smarty_tpl->tpl_vars['helpTextIdInline']->value[0],$_smarty_tpl->tpl_vars['helpTextIdInline']->value[1]));?>
    <?php } else { ?>
        <?php if (Language::isTranslationStringId($_smarty_tpl->tpl_vars['helpTextIdInline']->value)) {?>
            <?php $_smarty_tpl->_assignInScope('helpTextIdInline', $_smarty_tpl->tpl_vars['l10n']->value->get($_smarty_tpl->tpl_vars['helpTextIdInline']->value));?>
        <?php }?>
    <?php }?>
    <div class="help-block"><?php echo $_smarty_tpl->tpl_vars['helpTextIdInline']->value;?>
</div>
<?php }
}
}
