resource "tfe_workspace_run" "be-network-ws" {
  workspace_id = tfe_workspace.workspaces["be-network-ws"].id

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "fe-network-ws" {
  workspace_id = tfe_workspace.workspaces["fe-network-ws"].id

  depends_on = [tfe_workspace_run.be-network-ws]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "be-security-ws" {
  workspace_id = tfe_workspace.workspaces["be-security-ws"].id

  depends_on = [tfe_workspace_run.be-network-ws]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "fe-security-ws" {
  workspace_id = tfe_workspace.workspaces["be-security-ws"].id

  depends_on = [tfe_workspace_run.be-security-ws]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}


resource "tfe_workspace_run" "be-compute-ws" {
  workspace_id = tfe_workspace.workspaces["be-compute-ws"].id

  depends_on = [tfe_workspace_run.be-security-ws]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}

resource "tfe_workspace_run" "fe-compute-ws" {
  workspace_id = tfe_workspace.workspaces["be-compute-ws"].id

  depends_on = [tfe_workspace_run.be-security-ws]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}
