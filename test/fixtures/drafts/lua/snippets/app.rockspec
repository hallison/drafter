package = "<%=app.name%>"
version = "<%=app.version%>"
source = {
   url = "<%=app.source%>"
}
description = {
  summary = "<%=app.summary%>",
  detailed = [[
    <%=app.description%>
  ]],
  license = "<%=app.license%>",
  homepage = "<%=app.homepage%>"
}
dependencies = {
   <%for dependency in app.dependencies do%>
   <%=dependency%>,
   <%end%>
}
build = {
   type = "make",
   variables = {
      LUA_DIR = "$(LUADIR)",
      SYS_BINDIR = "$(BINDIR)"
   }
}

