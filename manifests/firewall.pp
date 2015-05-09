class profiles::firewall(
  $open,
  $tsomanaged_fwrules,
  $addl_fwrules,
) {
  if ( $open != false ) {
    profiles::helpers::fwrule { 'ssh_allowworld': }
    # potentially other "global rules" defining "open"
  }
  profiles::helpers::fwrule { $addl_fwrules: }

  profiles::helpers::fwrule { $tsomanaged_fwrules: }
}