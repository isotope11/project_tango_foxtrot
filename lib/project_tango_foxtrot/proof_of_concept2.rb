# Proof of Concept - insta-scaling
# ------
# So the title is obviously ~satirical, but the goal of this PoC is to show
# that with little effort, we can build a system atop DCell that can
# automatically configure itself to distribute load among its members and give
# some neat performance gains.
#
# A successful implementation will succeed in the following demo.
#
# 1) Build a basic website.
# 2) Using ab, show the requests per second that the webserver can manage.
# 3) Fire up the same project on another machine.  Perform no other configuration.
# 4) See rps ~double.

# First step  - get a manually-configured router + worker setup
# Second step - get router + (supervisor + worker) setup
# Third step  - Use supervisors + gossip announcements to manage the supervised spawning of my workers
# Fourth step - Use the above to build this PoC
