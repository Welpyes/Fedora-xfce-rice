#!/usr/bin/env python3
import i3ipc

# Define gap sizes
GAP_SINGLE = 35  # Gap for one window
GAP_MULTIPLE = 15  # Gap for multiple windows

def adjust_gaps(i3):
    # Get the focused workspace
    focused_workspace = i3.get_tree().find_focused().workspace()
    if not focused_workspace:
        print("No focused workspace found.")
        return

    # Count windows in the workspace
    window_count = len(focused_workspace.leaves())
    if window_count == 1:
        i3.command(f"gaps inner current set {GAP_SINGLE}")
    else:
        i3.command(f"gaps inner current set {GAP_MULTIPLE}")

def main():
    i3 = i3ipc.Connection()

    # Adjust gaps on startup
    adjust_gaps(i3)

    # Adjust gaps when windows are opened, closed, or workspace changes
    i3.on("window::new", lambda i3, _: adjust_gaps(i3))
    i3.on("window::close", lambda i3, _: adjust_gaps(i3))
    i3.on("workspace::focus", lambda i3, _: adjust_gaps(i3))

    # Start the event listener
    i3.main()

if __name__ == "__main__":
    main()
