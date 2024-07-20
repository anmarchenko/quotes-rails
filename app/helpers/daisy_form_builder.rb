class DaisyFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :safe_join, to: :@template

  def input(type, name, options = {})
    label_text = options.delete(:label) || name.to_s.humanize

    options[:class] = "input input-bordered #{options[:class]}"

    tag.label class: "form-control w-full max-w-xs" do
      safe_join([
        (tag.div class: "label" do
          tag.span class: "label-text" do
            label_text
          end
        end),
        send(type, name, options),
        errors(name)
      ])
    end
  end

  def submit(name, options = {})
    options[:class] = "btn btn-primary btn-sm #{options[:class]}"

    super
  end

  def errors(name)
    if @object&.errors&.[](name)&.any?
      tag.div class: "text-red-500 text-xs" do
        @object.errors[name].join(", ")
      end
    else
      ""
    end
  end
end
