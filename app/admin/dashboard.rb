ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Info" do
          para "Welcome to the Itonga Admin Dashboard."
        end
      end
      column do
        panel "Recent Enquiries" do
          ul do
            Enquiry.last(5).reverse.map do |enquiry|
              li link_to("#{enquiry.name} -" + " #{enquiry.created_at.to_s.delete('UTC')}", admin_enquiry_path(enquiry))
            end
          end
        end
      end
    end
  end # content
end
