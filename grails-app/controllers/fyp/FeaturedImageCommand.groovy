package fyp

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class FeaturedImageCommand implements Validateable {
    MultipartFile featuredImageFile
    Long id
    Long eventId
    Integer version

    static constraints = {
        id nullable: false
        version nullable: false
        eventId nullable:false
        
        featuredImageFile  validator: { val, obj ->
            if ( val == null ) {
                return false
            }
            if ( val.empty ) {
                return false
            }

            ['jpeg', 'jpg', 'png'].any { extension -> // <1>
                 val.originalFilename?.toLowerCase()?.endsWith(extension)
            }
        }
    }
}
