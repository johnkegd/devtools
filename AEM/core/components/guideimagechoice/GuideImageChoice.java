package libs.fd.af.components.guideimagechoice;

import com.adobe.aemds.guide.utils.GuideConstants;
import com.day.cq.wcm.foundation.forms.FormsHelper;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;


/**
 * GuideImageChoice encapsulates basic properties of the adaptive forms Image Choice Component.
 * Few are listed below:
 * <ul>
 * <li> Options of the Image choice component configured during authoring
 * <li> Alignment of the Image choice component configured during authoring
 * </ul>
 *
 * @since 6.3
 */
public class GuideImageChoice extends com.adobe.aemds.guide.common.GuideCheckBox {

    /**
     * Returns the options configured for the image choice component during authoring
     * @return Map whose keys are the index and the values are of type {saveValue=displayValue}.
     */
    public Map getOptions() {
        Map<String, String> options = FormsHelper.getOptions(slingRequest, super.getResource());
        if (options == null) {
            return null;
        }
        Map result = new LinkedHashMap<String, String>();
        Iterator<String> keySet = options.keySet().iterator();
        while (keySet.hasNext()) {
            String key = keySet.next();
            // value would be a file name, so we should not externalize it
            String value = options.get(key);
            // If value starts with ".", it means the path is relative. So we add the resource path to this value.
            if (value.indexOf("./") == 0) {
                value = (super.getResource()).getPath() + value.substring(1);
            }
            result.put(key, value);
        }
        return result;
    }

    public String getGuideFieldType() {
        if(GuideConstants.GUIDE_FIELD_RADIOBUTTON.equals(this.resourceProps.get(GuideConstants.ELEMENT_PROPERTY_NODECLASS))) {
            return resourceProps.get(GuideConstants.GUIDE_FIELD_RADIOBUTTONGROUP, GuideConstants.GUIDE_FIELD_CHECKBOX);
        } else {
            return super.getGuideFieldType();
        }
    }

    /**
     * Returns the type of HTML input element to be used.
     * If multi select is true, then the guideNodeClass for the component would be guideCheckBox,
     * otherwise it would be guideRadioButton.
     */
    public String getInputType() {
        if(GuideConstants.GUIDE_FIELD_RADIOBUTTON.equals(this.resourceProps.get(GuideConstants.ELEMENT_PROPERTY_NODECLASS))) {
            return GuideConstants.GUIDE_FIELD_RADIO_INPUT_TYPE;
        } else {
            return super.getInputType();
        }
    }

    /**
     * Return the name of class that should be applied to radio button item in case multi select is false
     * or to the check box item in case multi select is true
     */
    public String getItemClassName() {
        if(GuideConstants.GUIDE_FIELD_RADIOBUTTON.equals(this.resourceProps.get(GuideConstants.ELEMENT_PROPERTY_NODECLASS))) {
            return GuideConstants.GUIDE_FIELD_RADIOBUTTON_ITEM;
        } else {
            return super.getItemClassName();
        }
    }

    /**
     * Returns the  class based on appearance type that should be applied on a group of
     * check box items or radio button items
     */
    public String getItemsClass() {
        if(GuideConstants.GUIDE_FIELD_RADIOBUTTON.equals(this.resourceProps.get(GuideConstants.ELEMENT_PROPERTY_NODECLASS))) {
            return GuideConstants.GUIDE_FIELD_RADIOBUTTONGROUP_ITEMS;
        } else {
            return super.getItemsClass();
        }
    }
}
