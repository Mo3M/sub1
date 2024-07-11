function filter(node) {
  const info = JSON.parse(node.ProxyInfo);
  if(info.Port != "8443") {
    return true;  
  }
  return false;
}
