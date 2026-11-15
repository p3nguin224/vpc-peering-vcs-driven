resource "tfe_workspace_run" "be-network-ws" {
  workspace_id = data.tfe_workspace.workspaces["be-network-ws"].id


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
  workspace_id = data.tfe_workspace.workspaces["be-security-ws"].id

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

resource "tfe_workspace_run" "be-compute-ws" {
  workspace_id = data.tfe_workspace.workspaces["be-compute-ws"].id

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

resource "tfe_workspace_run" "fe-network-ws" {
  workspace_id = data.tfe_workspace.workspaces["fe-network-ws"].id

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
  workspace_id = data.tfe_workspace.workspaces["fe-security-ws"].id

  depends_on = [tfe_workspace_run.fe-network-ws]

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
  workspace_id = data.tfe_workspace.workspaces["fe-compute-ws"].id

  depends_on = [tfe_workspace_run.fe-security-ws]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}


resource "tfe_workspace_run" "vpc-peer-ws" {
  workspace_id = data.tfe_workspace.workspaces["vpc-peering"].id

  depends_on = [tfe_workspace_run.fe-compute-ws, tfe_workspace_run.be-compute-ws]

  apply {
    manual_confirm = false
    wait_for_run   = true
  }

  destroy {
    manual_confirm = false
    wait_for_run   = true
  }
}