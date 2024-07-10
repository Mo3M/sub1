function filter(node) {
  const info = JSON.parse(node.ProxyInfo);
  if(info.Port.includes('8443'))     return "🇺🇸 US";  
  return false;
}
