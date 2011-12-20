package = "<%=project.name%>"
version = "<%=project.version%>"
source = {
   url = "<%=project.source%>"
}
description = {
  summary = "<%=project.summary%>",
  detailed = [[
    <%=project.description%>
  ]],
  license = "<%=project.license%>",
  homepage = "<%=project.homepage%>"
}
dependencies = {
   <%for dependency in project.dependencies do%>
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

