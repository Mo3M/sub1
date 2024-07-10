function filter(node) {
  const info = JSON.parse(node.ProxyInfo);
  if(node.Port == "8443")     return true;  

  return false;
}
