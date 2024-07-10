function filter(node) {
  const info = JSON.parse(node.ProxyInfo);
  if(node.Port.includes('8443'))     
    return true;  
  if(info.Port.includes('8443'))     
    return true;  
  return false;
}
