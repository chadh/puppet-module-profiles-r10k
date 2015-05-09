define profiles::helpers::fwrule {
  include ::ccfirewall
  $hieravar = "profiles::helpers::fwrule::${name}"

  $merge_rules = hiera('profiles::helpers::fwrule::merge_rules')
  if ( $merge_rules == true ) {
    $firewall_rules = hiera_hash($hieravar)
  } else {
    $firewall_rules = hiera($hieravar)
  }
  create_resources('firewall',$firewall_rules)
}